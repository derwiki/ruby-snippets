ActiveSupport::Notifications.subscribe("sql.active_record") do |_, _, _, _, details|
  return # remove to enable logger
  if details[:sql] =~ /select/i
    Rails.logger.info caller.reject {|l| l =~ /(gems|rubies)/ }.join("\n")
    Rails.logger.info "=" * 80
  end
end
