require 'spec_helper'

describe Inquiry do
  let(:blanks){['', nil, ' ']}
  it { should have_valid(:first_name).when("Krystle")}
  it { should_not have_valid(:first_name).when(*blanks) }

  it { should have_valid(:last_name).when("Bates")}
  it { should_not have_valid(:last_name).when(*blanks) }

  it { should have_valid(:email).when("krebates@gmail.com")}
  it { should_not have_valid(:email).when("krebates@g")}
  it { should_not have_valid(:email).when(*blanks) }

  it { should have_valid(:subject).when("Great Job")}
  it { should_not have_valid(:subject).when(*blanks) }

  it { should have_valid(:description).when("You are gggrrreat!")}
  it { should_not have_valid(:description).when(*blanks) }

  it 'should be unique' do
    inquiry1 = FactoryGirl.build(:inquiry)
    inquiry2 = FactoryGirl.build(:inquiry)
    expect(inquiry1.save).to be_true
    expect(inquiry2.save).to be_false
  end
end
