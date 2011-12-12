module MailerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :initialize_defaults, :sender
    end
  end

  module InstanceMethods
    def initialize_defaults_with_sender(method_name)
      initialize_defaults_without_sender(method_name)
      sender = smtp_settings[:sender]
      if sender
        headers['Sender'] = sender
      else
        Rails.logger.warn "Missing setting of */email_delivery/smtp_settings/sender in \"config/configuration.yml\"."
      end
    end
  end
end
