require 'mechanize'

module Roart
  module ConnectionAdapters
    class MechanizeAdapter

      def initialize(config)
        @conf = config
      end

      def login(config)
        @conf.merge!(config)
        agent = Mechanize.new
        page = agent.get(@conf[:server])
        form = page.form('login')
        form.user = @conf[:user]
        form.pass = @conf[:pass]
        page = agent.submit form
        @agent = agent
      end

      def get(uri)
        @agent.get(uri).body
      end

      def post(uri, payload)
        @agent.post(uri, payload).body
      end

    end
  end
end
