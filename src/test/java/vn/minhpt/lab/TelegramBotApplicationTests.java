package vn.minhpt.lab;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import vn.minhpt.lab.notifi.DailyNotification;

@SpringBootTest
class TelegramBotApplicationTests {

    @Autowired
    DailyNotification dailyNotifi;

    @Test
    void contextLoads() {
    }

    @Test
    public void logTimeTest() {
//        dailyNotifi.createPollBadminton();
    }
}
