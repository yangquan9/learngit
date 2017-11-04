package com.eduask.domain;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

public class User implements Serializable {
    private Integer id;
    @Pattern(regexp="[\ue4900-\u9fa5]{2,4}",message="姓名必须是2到4个中文")
    private String name;
    @Past(message="生日必须早于今天")
    @NotNull(message="生日必须早于今天")
    private Date birthday;
    @Range(min=1000,message="存款不能小于1000")
    @NotNull(message="存款不能小于1000")
    private Long money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Long getMoney() {
        return money;
    }

    public void setMoney(Long money) {
        this.money = money;
    }
    public User() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", birthday=" + birthday
				+ ", money=" + money + "]";
	}
    
}