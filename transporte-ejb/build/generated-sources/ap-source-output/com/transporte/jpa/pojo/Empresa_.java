package com.transporte.jpa.pojo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Empresa.class)
public abstract class Empresa_ {

	public static volatile SingularAttribute<Empresa, String> numdocumentoNit;
	public static volatile SingularAttribute<Empresa, Long> idempresa;
	public static volatile SingularAttribute<Empresa, String> direccion;
	public static volatile SingularAttribute<Empresa, Ciudad> idciudad;
	public static volatile SingularAttribute<Empresa, Long> telefono;
	public static volatile SingularAttribute<Empresa, String> nombre;
	public static volatile SingularAttribute<Empresa, Persona> idpersonaRepresentante;
	public static volatile SingularAttribute<Empresa, String> tipodocumento;

}

