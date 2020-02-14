/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transporte.facade.entity;

import com.transporte.facade.general.AbstractFacade;
import com.transporte.jpa.pojo.Ciudad;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

@Stateless
public class CiudadFacade extends AbstractFacade<Ciudad> {

    @PersistenceUnit
    private EntityManagerFactory emf;

    @Override
    protected EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public CiudadFacade() {
        super(Ciudad.class);
    }

    @Override
    protected String[] attrsQueryLight() {
        String[] attrs = {"idciudad", "nombre"};
        return attrs;
    }

    @Override
    protected String[] attrFullTextCriteria() {
        String[] attrs = {"idciudad", "nombre"};
        return attrs;
    }

    @Override
    protected Ciudad parseObject(Object[] o) {
        
        Ciudad e = new Ciudad();
        e.setIdciudad((Integer) o[0]);
        e.setNombre((String) o[1]);
        
        return e;
    }

    @Override
    public void create(Ciudad obj, StringBuilder err) {
        createGeneral(obj, err);
    }

    @Override
    public void edit(Ciudad obj, StringBuilder err) {
        editGeneral(obj, err);
    }

    @Override
    public void delete(Object idbarrio, StringBuilder err) {
        deleteGeneral(idbarrio, err);
    }

}
