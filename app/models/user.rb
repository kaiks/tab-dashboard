# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :to_do_items
  has_many :pending_to_do_items, lambda {
                                   where(done: false, removed: false)
                                     .where("COALESCE(deadline, '2999-01-01') >= CURRENT_DATE AND valid_from <= CURRENT_DATE")
                                     .order('created_at desc')
                                 }, class_name: 'ToDoItem'
  has_many :knowledge_repositories
end
