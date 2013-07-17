module Hipbot
  class Room
    def set_topic topic
      Hipbot.set_topic(self, topic)
    end

    def send_message message
      Hipbot.send_to_room(self, message)
    end

    def invite users
      Hipbot.invite_to_room(self, users)
    end

    def kick users
      Hipbot.kick_from_room(self, users)
    end

    def users
      @users ||= []
    end
  end
end
