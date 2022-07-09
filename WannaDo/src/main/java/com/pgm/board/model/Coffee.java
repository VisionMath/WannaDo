package com.pgm.board.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "wannado_allcoffee")
@Data
public class Coffee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String taste;
    private String blend;
    private String price;
    private String roastery;
    private String added;
    private String image;
    private String roasteryimage;
    private String alterimage;

    @Lob
    private String tastedescription;

    private String alterroastery;
    private String shipping;
    @Column(name = "class")
    private String type;
    private String acidity;
    private String blendproperty;
    private String roasting;
    private String subimage1;
    private String subimage2;
    private String subimage3;
    private String prize;

    @Lob
    private String content;

    private String location;
    private String extraction;

    private String drinkbest;
    private String origin2;

//	private Long hitcount;
//	
//	@PrePersist
//	public void prePersist() {
//		this.hitcount = this.hitcount == null ? 0 : this.hitcount;
//	}

//	@OneToMany(mappedBy="board",
//			fetch=FetchType.LAZY, cascade=CascadeType.ALL)
//	@JsonIgnore
//	private List<Reply> reply;
//	
//	@ManyToOne(fetch=FetchType.LAZY)
//	@JoinColumn(name="user_id")
//	private User user;
//	

}