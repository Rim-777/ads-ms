# frozen_string_literal: true

class Ad < Sequel::Model
  include ::Validations

  def validate
    super
    validates :presence, :city, :title, :description
    validates :presence, :user_id_ref,
              message: I18n.t(:required, scope: 'model.errors')
  end
end
