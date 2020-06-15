package com.project.lisa.service;

import com.project.lisa.entity.Customer;
import com.project.lisa.entity.Team;
import com.project.lisa.repository.CustomerRepository;
import com.project.lisa.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamDataService {
    @Autowired
    TeamRepository teamRepository;

    public List<Team> findAll(){
        return teamRepository.findAll();
    }
}
