
class National < ActiveRecord::Base
  # has_settings do |s|
  #   s.key :phoneApp, :defaults => { :showDesignation => true }
  # end

  # attr_accessor   :email, :facebook, :formal_name, :logo, :phone, :twitter, :youtube, :url, :user_id,
  #                 :designation, :whitelabel, :app_id, :single_local, :css, :base_color,
  #                 :apns_certificate_development, :apns_certificate_production,
  #                 :gcm_api_key_development, :gcm_api_key_production,
  #                 :membership_module, :main_module, :customized_registration, :play_store, :app_store, :qr_key, :custom_form_module, :paying_for,
  #                 :users_attributes, :locals_attribute, :terms, :showDesignation

  attr_accessor :apns_certificate_development, :apns_certificate_production,
                :gcm_api_key_development, :gcm_api_key_production

  def self.settings_attr_accessor(*args)
    args.each do |method_name|
      eval "
        def #{method_name}
          self.settings(:phoneApp).send(:#{method_name})
        end
        def #{method_name}=(value)
          self.settings(:phoneApp).send(:#{method_name}=, (value == '0') ? false : true)
        end
      "
    end
  end

  settings_attr_accessor :showDesignation

  PAYING_FOR = { verified: 0, registered: 1, all: 2 }
  # validates :paying_for, :inclusion => { :in => PAYING_FOR.keys}, :allow_nil => false

  # after_validation :format_phone_number

  # Validations
  # validates :formal_name, :uniqueness => true, :presence => true
  # #validates :common_name, :uniqueness => { :allow_blank => true, :allow_nil => true }
  # validates :abbreviation, :uniqueness => { :allow_blank => true, :allow_nil => true }
  # validates :address, :presence => true
  # validates :phone, :presence => true, :phone => true
  # validates :email, :email => {:allow_blank => true, :allow_nil => true }
  # validates :designation, :presence => true
  # #validates_inclusion_of :terms, :in =>[1, true]
  #
  # Relationships
  has_one :apn_app, :class_name => "APN::App", :dependent => :destroy
  has_one :gcm_app, :class_name => "Gcm::App", :dependent => :destroy

  HIDE_BARGAINING_UNITS_FOR_NATIONAL = ['UBC 1503']

  # accepts_nested_attributes_for :users
  # # Uploaders
  # mount_uploader :logo, NationalLogoUploader
  # process_in_background :logo
  #
  # def get_logo
  #   if (self.logo_url != nil) && (self.logo_url != "")
		# 	self.logo_url
		# else
		#   Myunionjob::Application.config.settings['defaultLogo']
	 #  end
  # end
  #
  # def common_name_with_abbr
  #   "#{self.common_name} ( #{self.abbreviation.split(" ")[0]} )"
  # end

  def apns_certificate_development
    apns_certificate_getter(:development)
  end

  def apns_certificate_development=(certificate)
    apns_certificate_setter(:development, certificate)
  end

  def apns_certificate_production
    apns_certificate_getter(:production)    
  end
  def apns_certificate_production=(certificate)
    apns_certificate_setter(:production, certificate)
  end

  def gcm_api_key_development
    gcm_api_key_getter(:development)
  end

  def gcm_api_key_development=(api_key)
    gcm_api_key_setter(:development, api_key)
  end

  def gcm_api_key_production
    gcm_api_key_getter(:production)
  end

  def gcm_api_key_production=(api_key)
    gcm_api_key_setter(:production, api_key)
  end

  private
    def apns_certificate_getter(type)
      certificate_type = "apns_certificate_#{type}".to_sym
      if !!self.apn_app
        self[certificate_type] = (type == :development ? self.apn_app.apn_dev_cert : self.apn_app.apn_prod_cert)
      else
        self[certificate_type] = nil
      end
    end

    # For now, type is ignored
    def gcm_api_key_getter(type)
      if !!self.gcm_app
        self[type] = self.gcm_app.api_key
      else
        self[type] = nil
      end
    end

    def apns_certificate_setter(type, certificate)
      if !self.apn_app
        unless apn_app = APN::App.create        
          raise "Error creating APN App"
        end
        self.apn_app = apn_app
      else
        apn_app = self.apn_app
      end

      if type == :development
        apn_app.apn_dev_cert = certificate
      else
        apn_app.apn_prod_cert = certificate
      end

      apn_app.save
    end

    # For now, type is ignored
    def gcm_api_key_setter(type, api_key)
      if !self.gcm_app
        unless gcm_app = Gcm::App.create(api_url: "https://android.googleapis.com/gcm/send", app_name: self.whitelabel)
          raise "Error creating Gcm App"
        end
        self.gcm_app = gcm_app
      else
        gcm_app = self.gcm_app
      end

      gcm_app.api_key = api_key
      gcm_app.save
    end

end
