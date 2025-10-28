package com.monrab.ecommerce.payload.request;

import java.util.UUID;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor

public class NotificationRequest {
    private String title;
    private String description;
    private UUID userId;
    private boolean sendEmail;

}
