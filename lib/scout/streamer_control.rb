module Scout
  class StreamerControl < DaemonSpawn::Base

    # args are: server, key, history, plugin_ids, streaming_key, log
    def start(args)
      server,key,history,plugin_ids,streaming_key,log = args
      $continue_streaming = true #needed for streamer to loop

      @scout = Scout::Streamer.new(server, key, history, plugin_ids, streaming_key, log)
      File.unlink(pid_file) if File.exists?(pid_file) # a better way of doing this?
    end

    def stop
      $continue_streaming = false
    end
  end
end
