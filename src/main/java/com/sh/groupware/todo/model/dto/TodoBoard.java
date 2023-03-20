package com.sh.groupware.todo.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TodoBoard {

	private String no;
	private String title;
	private String empId;
	private BookMark bookMark;
	private List<TodoList> todoLists;
	
	
}
