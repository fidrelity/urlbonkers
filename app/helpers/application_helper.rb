module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def buy_domain_url(domain)
    "https://www.namecheap.com/domains/registration/results.aspx?domain=#{domain}"
  end
end
