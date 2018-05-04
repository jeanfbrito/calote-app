module EventsHelper
  def confirmed_bagde(confirmed)
    content_tag(:span, t("event.confirmed.#{confirmed}"), class: "badge #{(confirmed)? 'badge-success' : 'badge-danger' }")
  end
end
