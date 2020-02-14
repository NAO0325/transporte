/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transporte.facade.entity;

import com.transporte.facade.general.AbstractFacade;
import com.transporte.jpa.pojo.Empresa;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

@Stateless
public class EmpresaFacade extends AbstractFacade<Empresa> {

    @EJB
    PersonaFacade personFacade;
    @PersistenceUnit
    private EntityManagerFactory emf;

    @Override
    protected EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public EmpresaFacade() {
        super(Empresa.class);
    }

    @Override
    protected String[] attrsQueryLight() {
        String[] attrs = {"idempresa", "nombre", "idpersonaRepresentante.nombres", "idpersonaRepresentante.apellidos", "numdocumentoNit", "tipodocumento", "direccion", "telefono"};
        return attrs;
    }

    @Override
    protected String[] attrFullTextCriteria() {
        String[] attrs = {"nombre", "numdocumentoNit"};
        return attrs;
    }

    @Override
    protected Empresa parseObject(Object[] o) {
        Empresa e = new Empresa((Long) o[0]);

        e.setNombre((String) o[1]);
        e.getIdpersonaRepresentante().setNombres((String) o[2]);
        e.getIdpersonaRepresentante().setApellidos((String) o[3]);
        e.setNumdocumentoNit((String) o[4]);
        e.setTipodocumento((String) o[5]);
        e.setDireccion((String) o[6]);
        e.setTelefono((Long) o[7]);

        return e;
    }

    @Override
    public void create(Empresa obj, StringBuilder err) {
        createGeneral(obj, err);
    }

    @Override
    public void edit(Empresa obj, StringBuilder err) {
        editGeneral(obj, err);
    }

    @Override
    public void delete(Object idempresa, StringBuilder err) {

        /*Person p = personFacade.findByIdempresa(idempresa);
        
        if (p != null) {
            err.append("La empresa esta asociada a un registro de person!");
            return;
        }*/
        deleteGeneral(idempresa, err);
    }

}
