class RolesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

=begin
  acts_as_state_machine :initial => :active
  state :suspended
  state :warned
  
  event :suspend do
    transitions :from => [:active, :warn], :to => :suspended
  end
  
  event :warn do
    transitions :from => [:active, :suspended], :to => :warned
  end
=end
end