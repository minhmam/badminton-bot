package vn.minhpt.lab.notifi;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import vn.minhpt.lab.TelegramBot;

@Component
@Slf4j
public class DailyNotification {

    @Autowired
    TelegramBot telegramBot;

    @Value("${badminton.admin_chat_id}")
    private Long chatIdAdmin;

    @Value("${badminton.group_chat_id}")
    private Long groupChatId;

    @Scheduled(cron = "0 0 8 ? * FRI")
    public void createPollBadminton() {
        log.info("---------------------SCHEDULE CREATE POLL BADMINTON---------------------");
        try {
            telegramBot.createPollBadminton(groupChatId);
        } catch (Exception e) {
            telegramBot.sendMessage(chatIdAdmin, e.getMessage());
        }
    }
}
