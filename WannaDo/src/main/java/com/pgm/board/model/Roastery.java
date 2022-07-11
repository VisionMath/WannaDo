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
@Table(name = "wannado_roastery")
@Data
public class Roastery {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rid")
	private Long rid;

	private String name;
	private String image;
	private String subimage1;
	private String subimage2;
	private String subimage3;

	@Lob
	private String content;

	private String location;
	private String instagram;
	private String website;

}