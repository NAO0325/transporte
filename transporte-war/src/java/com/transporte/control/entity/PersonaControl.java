/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transporte.control.entity;

import com.transporte.control.general.AbstractControl;
import com.transporte.facade.entity.PersonaFacade;
import com.transporte.facade.general.AbstractFacade;
import com.transporte.jpa.pojo.Persona;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "personaControl")
@RequestScoped
public class PersonaControl extends AbstractControl<Persona> {

    @EJB
    PersonaFacade facade;

    public PersonaControl() {
        super(Persona.class);
        attrOrd = "nombres";
        ascDesc = "ASC";
    }

    public void nuevo() {
        createDefault();
    }

    public void editar() {
        editDefault();
    }

    public void eliminar() {
        StringBuilder err = new StringBuilder();
        facade.delete(facesUtil.getFacesParamLong("idpersona_"), err);
        if (err.toString().isEmpty()) {
            successful = true;
            facesUtil.msgOk("", "Registro eliminado !");
        } else {
            successful = false;
            facesUtil.msgError("ALERTA: ", err.toString());
        }
    }

    @Override
    protected AbstractFacade getFacade() {
        return facade;
    }

    protected PersonaFacade getPersonFacade() {
        return facade;
    }

    @Override
    protected String displayObj(Persona obj) {
        return obj.getNombres() + " " + obj.getApellidos();
    }

}
