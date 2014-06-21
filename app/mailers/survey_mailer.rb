class SurveyMailer < ActionMailer::Base
  default from: "admin@example.com"
  def notify(user, surveyee, survey)
  	@user = user
  	@surveyee = surveyee
    @url  = take_survey_url(surveyee.random_string)
    mail(to: surveyee.email, subject: 'Welcome to Survey Application', content_type: "text/html")
  end
end
