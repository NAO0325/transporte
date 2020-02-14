/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transporte.control.entity;

import com.transporte.control.general.AbstractControl;
import com.transporte.facade.entity.EmpresaFacade;
import com.transporte.facade.general.AbstractFacade;
import com.transporte.jpa.pojo.Empresa;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "empresaControl")
@RequestScoped
public class EmpresaControl extends AbstractControl<Empresa> {

    @EJB
    EmpresaFacade facade;

    public EmpresaControl() {
        super(Empresa.class);
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
        facade.delete(facesUtil.getFacesParamLong("idempresa_"), err);
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

    protected EmpresaFacade getEmpresaFacade() {
        return facade;
    }

    @Override
    protected String displayObj(Empresa obj) {
        return obj.getNombre()+ " - " + obj.getNumdocumentoNit();
    }

}
