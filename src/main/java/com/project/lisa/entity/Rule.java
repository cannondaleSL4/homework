package com.project.lisa.entity;

import lombok.Data;
import lombok.Getter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data
public class Rule {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Getter
    private Integer id;
    private String name;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
            name = "rule_of_role",
            joinColumns = { @JoinColumn(name = "rule_id") },
            inverseJoinColumns = { @JoinColumn(name = "project_rule_id") }
    )
    Set<ProjectRole> projectRoles = new HashSet<>();

    @Override
    public String toString() {
        return String.format(
                "Rule[id=%d, name='%s']",
                id, name);
    }
}
