# Simplificate calls to get the final Hash
def get_mk(query)
  mk_array_to_hash(JSON.parse(get_mk_livestatus(query)))
end

# Eat an Hash (all optional):
# :state          Integer
# :host_name      String
# :in_notification_period   Integer, default to 1
# Not currently used
def get_services(opts)
  query = { :table => "services" }
  extras_headers = ""
  if opts.include? :state
    extras_headers << "Filter: state = #{opts[:state]}\n"
  end
  if opts.include? :host_name
    extras_headers << "Filter: host_name = #{opts[:host_name]}\n"
  end
  if opts.include? :in_notification_period
    extras_headers << "Filter: in_notification_period = #{opts[:in_notification_period]}\n"
  end
  query[:extras_headers] = extras_headers
  return get_mk(query)
end
