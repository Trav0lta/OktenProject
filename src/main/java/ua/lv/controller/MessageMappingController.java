package ua.lv.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import ua.lv.entity.chat.Message;
import ua.lv.entity.chat.OutputMessage;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MessageMappingController {


    @MessageMapping("/chat") // от кого принимать Message
    @SendTo("/topic/messages") // куда отправлять ответ OutputMessage
    public OutputMessage send(Message message) throws Exception {
        String time = new SimpleDateFormat("HH:mm:ss").format(new Date());
        return new OutputMessage(message.getFrom(), message.getText(), time);
    }
}
