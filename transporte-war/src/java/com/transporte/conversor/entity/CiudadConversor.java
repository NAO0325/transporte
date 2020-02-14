package com.transporte.conversor.entity;

import com.transporte.facade.entity.CiudadFacade;
import com.transporte.jpa.pojo.Ciudad;
import com.transporte.util.BeanUtil;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author napoavi@gmail.com
 */
@FacesConverter(forClass = Ciudad.class)
public class CiudadConversor implements Converter {

    CiudadFacade bean = BeanUtil.lookupFacadeBean(CiudadFacade.class);

    @Override
    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        return bean.find(Integer.parseInt(string));
    }

    @Override
    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        Ciudad o = (Ciudad) object;
        if (o.getIdciudad()== null) {
            return null;
        }
        return o.getIdciudad().toString();
    }
}
