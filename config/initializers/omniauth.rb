Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'IV5Wk8vuVLdFiQgKRFQVrg', 'fizbadRcQ4Nj6KIxBs9jmHsR4v1lj8VLRKyfCMviIck'
  provider :facebook, '183554385043336', '4d3604ae5a450fc87f24c73d03b1f2e5', {client_options: {ssl: {ca_file: Rails.root.join('ca_bundle.crt').to_s}}}

end


module OAuth2
  class Client
    def initialize(client_id, client_secret, opts = {})
      adapter = opts.delete(:adapter)
      self.id = client_id
      self.secret = client_secret
      self.site = opts.delete(:site) if opts[:site]
      self.options = opts
      self.connection = Faraday::Connection.new(site, {ssl: opts.delete(:ssl)})
      self.json = opts.delete(:parse_json)        # ^ my code starts here

      if adapter && adapter != :test
        connection.build { |b| b.adapter(adapter) }
      end
    end
  end
end
