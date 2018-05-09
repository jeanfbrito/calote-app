class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    text_field_options = input_html_options.dup
    hidden_field_options = input_html_options.dup
    hidden_field_options[:class] = input_html_options[:class].dup # so they won't work with same array object

    text_field_options[:class] << 'date-picker'
    text_field_options['data-date-format'] = I18n.t('date.datepicker')

    hidden_field_options[:id] = "#{attribute_name}_hidden"

    return_string =
      "#{@builder.text_field(attribute_name, text_field_options)}\n" +
      "#{@builder.hidden_field(attribute_name, hidden_field_options)}\n"
    return return_string.html_safe
  end
end