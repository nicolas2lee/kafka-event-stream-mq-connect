package tao;

import com.ibm.jms.JMSTextMessage;
import com.ibm.mq.MQMessage;
import com.ibm.mq.headers.MQRFH2;
import com.ibm.mq.pcf.CMQC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jms.JmsException;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessagePostProcessor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.jms.JMSException;
import javax.jms.Message;
import java.io.IOException;
import java.util.Optional;

@SpringBootApplication
@RestController
@EnableJms
public class MqspringApplication {

    @Autowired
    private JmsTemplate jmsTemplate;

    public static void main(String[] args) {
        SpringApplication.run(MqspringApplication.class, args);
    }

    @GetMapping("send")
    String send() throws IOException, JMSException {

        try{
            jmsTemplate.convertAndSend("DEV.QUEUE.1", "it is a test", new MessagePostProcessor() {
                @Override
                public Message postProcessMessage(Message message) throws JMSException {
                    message.setStringProperty("xtestheader", "a ref");
                    return message;
                }
            });
            return "OK";
        }catch(JmsException ex){
            ex.printStackTrace();
            return "FAIL";
        }
    }

    @JmsListener(destination = "DEV.QUEUE.1")
    public void receivedMessage(Message message){
        Optional.ofNullable(message).ifPresent(msg-> {
            System.out.println(msg.toString());
            try {
                System.out.println(msg.getStringProperty("xtestheader"));
            } catch (JMSException e) {
                e.printStackTrace();
            }
        });
    }

}