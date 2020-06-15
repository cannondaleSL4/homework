package com.project.lisa.entity;

import lombok.Data;
import lombok.Getter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data
public class ProjectRole {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Getter
    private Integer id;
    private String name;

    @ManyToMany(mappedBy = "project_roles")
    private Set<Rule> rules = new HashSet<>();

    @Override
    public String toString() {
        return String.format(
                "ProjectRole[id=%d, name='%s']",
                id, name);
    }
}
