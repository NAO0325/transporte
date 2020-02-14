/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transporte.control.entity;

import com.transporte.control.general.AbstractControl;
import com.transporte.facade.entity.CiudadFacade;
import com.transporte.facade.general.AbstractFacade;
import com.transporte.jpa.pojo.Ciudad;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "ciudadControl")
@RequestScoped
public class CiudadControl extends AbstractControl<Ciudad> {

    @EJB
    CiudadFacade facade;

    public CiudadControl() {
        super(Ciudad.class);
        attrOrd = "nombre";
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
        facade.delete(facesUtil.getFacesParamLong("idciudad_"), err);
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

    protected CiudadFacade getCiudadFacade() {
        return facade;
    }

    @Override
    protected String displayObj(Ciudad obj) {
        return obj.getNombre();
    }

}
