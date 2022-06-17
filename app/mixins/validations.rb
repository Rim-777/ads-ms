module Validations
  def validates(type, *attrs, **options)
    options_message = options[:message]

    attrs.each do |attr|
      message =
        if options_message
          options_message
        else
          I18n.t(
            error_key(type),
            scope: 'model.errors', attr: attr
          )
        end

      send("validates_#{type}", attr, message: message)
    end
  end

  private

  def error_key(type)
    case type
    when :presence
      :blank
    end
  end
end
