/**
 * 
 */
package com.poorna.rk.sections.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.sections.domain.Sections;
import com.poorna.rk.sections.repository.SectionsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class SectionsService {
	
	@Autowired
	SectionsRepository sectionsRepository;
	

	public Sections addNew(Sections sections) {
		
		sectionsRepository.save(sections);
		return sections;
	}

	public List<Sections> getSections() {
		List<Sections> sections = new ArrayList<>();
		sectionsRepository.findAll()
		.forEach(sections::add);
		return sections;
	}
	public void updateSections(Sections sections, Long siNo) {
		sectionsRepository.save(sections);	
		
		
	}

	public void deleteSections(Long siNo) {
		sectionsRepository.delete(siNo);
	}
	

	}
	

