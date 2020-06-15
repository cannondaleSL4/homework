package com.project.lisa.repository;

import com.project.lisa.entity.ProjectRole;
import com.project.lisa.entity.Rule;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRoleRepository extends CrudRepository<ProjectRole, Long> {

    List<ProjectRole> findAll();
}
