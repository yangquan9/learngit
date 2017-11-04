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
    @Pattern(regexp="[\ue4900-\u9fa5]{2,4}",message="����������2��4������")
    private String name;
    @Past(message="���ձ������ڽ���")
    @NotNull(message="���ձ������ڽ���")
    private Date birthday;
    @Range(min=1000,message="����С��1000")
    @NotNull(message="����С��1000")
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