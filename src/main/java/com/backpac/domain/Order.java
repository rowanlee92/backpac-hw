package com.backpac.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Table(name="backpac_order")
public class Order {

    @Id
    @GeneratedValue
    @Column(name = "order_id", nullable = false)
    private Long id;

    @Column(length = 12, nullable = false)
    private String orderNo;

    @Column(length = 100, nullable = false)
    private String productName;

    @Column(nullable = false)
    private LocalDateTime paymentTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

}
