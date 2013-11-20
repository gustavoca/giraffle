class Notifier < ActionMailer::Base
  default from: "no-reply@giraffle.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.event_set_created.subject
  #
  def event_set_created(member, event)
    @member = member
    @event  = event

    mail to: member.email, subject: 'New Event Set Created!'
  end
end
