package com.apache.repository;

import com.apache.model.EssayEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by shy on 2016/3/17.
 */
@Repository
public interface EssayRepository extends JpaRepository<EssayEntity, Integer> {
}
