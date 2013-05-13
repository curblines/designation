# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medium, :class => 'Media' do
    attribution ""
    description ""
    medium ""
    inception "2013-05-11 22:12:45"
  end
end
