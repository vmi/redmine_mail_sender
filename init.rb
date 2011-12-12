require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :redmine_mail_sender do
  require_dependency 'mailer'
  Mailer.send(:include, MailerPatch)
end

Redmine::Plugin.register :redmine_mail_sender do
  name 'Redmine Mail Sender plugin'
  author 'IWAMURO Motonori'
  description 'Add "Sender:" field to mails sent by Redmine.'
  version '0.0.1'
  url 'http://vmi.jp/software/ruby/redmine_mail_sender.html'
  author_url 'http://vmi.jp/'

  requires_redmine :version_or_higher => '1.2.0'
end
