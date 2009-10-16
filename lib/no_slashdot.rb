class NoSlashdot
  def initialize(app, options = {})
    @app = app
    @options = options
    @options[:redirect] ||= 'http://slashdot.org'
  end

  def call(env)
    slashdot_sent_ya?(env) ? kick_it : @app.call(env)    
  end

  private
  def slashdot_sent_ya?(env)
    if env['HTTP_REFERER']
      is_slashdot?(env['HTTP_REFERER']) and @options[:redirect] != env['PATH_INFO']
    end
  end
  
  def is_slashdot?(referer_string)
    referer_string.match(/slashdot.org/) ? true : false
  end

  def kick_it
    [301, {'Location' => @options[:redirect]}, 'Fail browser is fail']
  end
end