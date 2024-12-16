package vn.minhpt.lab;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.polls.SendPoll;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.api.objects.polls.PollAnswer;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.util.Arrays;
import java.util.Calendar;

@Component
@Transactional
@PropertySource("classpath:telegram.properties")
public class TelegramBot extends TelegramLongPollingBot {
    Message message = null;
    private static final Logger logger = LoggerFactory.getLogger(TelegramBot.class);

    @Value("${bot.name}")
    private String botName;

    @Value("${bot.token}")
    private String botToken;

    @Value("${badminton.admin_chat_id}")
    private Long chatIdAdmin;

    @Value("${badminton.group_chat_id}")
    private Long groupChatId;

    private static final String YES = "🏸";
    private static final String NO = "💤";

    @Override
    public void onUpdateReceived(Update update) {
        if (update.getPollAnswer() != null) {
            PollAnswer pollAnswer = update.getPollAnswer();
            sendMessage(chatIdAdmin, pollAnswer.getUser().getUserName() + " voted: " + (pollAnswer.getOptionIds().get(0) == 0 ? YES : NO));
        } else if (update.getPoll() != null) {
            System.out.println("Poll received");
        } else if (update.getMessage() != null) {
            message = update.getMessage();
            Long chatId = message.getChatId();
            if (chatId.equals(chatIdAdmin)) {
                String text = message.getText().split(" ")[0];
                switch (text) {
                    case "/start":
                        sendMessage(chatId, "/poll Create vote");
                        break;
                    case "/poll":
                        createPollBadminton(groupChatId);
                        break;
                    default:
                        sendMessage(chatId, "I don't understand you");
                }
            }
        }
    }

    public void sendMessage(long chatId, String text) {
        SendMessage message = new SendMessage(String.valueOf(chatId), text);
        try {
            execute(message);
            logger.debug("Successful message sending from author with id: " + chatId);
        } catch (Throwable t) {
            logger.error("error sending message by author with id: " + chatId, t);
        } finally {
            onClosing();
        }
    }

    @Override
    public String getBotUsername() {
        return botName;
    }

    @Override
    public String getBotToken() {
        return botToken;
    }

    public void createPollBadminton(Long groupChatId) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1);
        SendPoll poll = new SendPoll();
        poll.setChatId(groupChatId.toString());
        poll.setQuestion("Thứ " + calendar.get(Calendar.DAY_OF_WEEK) + " - " + calendar.get(Calendar.DAY_OF_MONTH) + "/" + (calendar.get(Calendar.MONTH) + 1));
        poll.setOptions(Arrays.asList(YES, NO));
        poll.setIsAnonymous(false);

        try {
            execute(poll);
        } catch (TelegramApiException e) {
            throw new RuntimeException("Error when create poll badminton: " + e.getMessage());
        }
    }
}
