package com.project.lisa.repository;

import com.project.lisa.entity.Customer;
import com.project.lisa.entity.Rule;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RuleRepository extends CrudRepository<Rule, Long> {

    List<Rule> findAll();
}
