# A collection of utility based functions.
module Utils
  require 'pp'

  # example: Utils.debug("message", variable_to_inspect)
  def self.debug(log_message, log_object = nil)
    caller_name = (caller[0]).sub('in `', '').sub('\'', '').gsub(/.*\/trunk\//, '')

    msg = caller_name + ": #{log_message}\n"

    log_msg("#{name}.#{__method__}", msg, log_object)
  end

  def self.log_msg(method_str, msg, log_object, no_id = false)
    process = File.basename($0).to_s.gsub(/[^0-9A-z._\-\/]/, '_').gsub(/_[_]+/, '_')
    logfile = "/tmp/job_seeker.#{process}.log"

    msg = if no_id
            "#{method_str} #{msg}"
          else
            "#{method_str} #{process} [#{$$}] #{Time.now.strftime('%F:%R')} #{msg}"
          end

    if log_object
      log_msg = PP.pp(log_object, '').to_s
      log_msg = log_msg.gsub(/\d\d\d\d-\d\d-\d\d \d\d:\d\d[:\d\d]*/, 'DATETIME').gsub(/[Ii][Dd][ ]*[:=][ ]*[\\"]*[0-9]+[\\"]*/, 'id=XXXXX').gsub(/:0x[0-9ABCDEFabcdef]+/, ':YYYYY')  if no_id
      msg += log_msg
    end
    msg += "<<<\n"

    File.open(logfile.to_s, 'a') do |f|
      f.write(msg)
    end

    puts msg
  end
end
