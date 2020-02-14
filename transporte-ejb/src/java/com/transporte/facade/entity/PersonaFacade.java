/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transporte.facade.entity;

import com.transporte.facade.general.AbstractFacade;
import com.transporte.jpa.pojo.Persona;
import java.math.BigInteger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

@Stateless
public class PersonaFacade extends AbstractFacade<Persona> {
    
    @PersistenceUnit
    private EntityManagerFactory emf;
    
    @Override
    protected EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public PersonaFacade() {
        super(Persona.class);
    }
    
    @Override
    protected String[] attrsQueryLight() {
        String[] attrs = {"idpersona", "nombres", "apellidos", "numdocumento"};
        return attrs;
    }
    
    @Override
    protected String[] attrFullTextCriteria() {
        String[] attrs = {"nombres", "apellidos", "numdocumento"};
        return attrs;
    }
    
    @Override
    protected Persona parseObject(Object[] o) {
        Persona p = new Persona((Long) o[0]);
        p.setNombres((String) o[1]);
        p.setApellidos((String) o[2]);
        p.setNumdocumento(new BigInteger(o[2].toString()));
        
        return p;
    }
    
    @Override
    public void create(Persona obj, StringBuilder err) {
        createGeneral(obj, err);
    }
    
    @Override
    public void edit(Persona obj, StringBuilder err) {
        editGeneral(obj, err);
    }
    
    @Override
    public void delete(Object idperson, StringBuilder err) {
        deleteGeneral(idperson, err);
    }
}
