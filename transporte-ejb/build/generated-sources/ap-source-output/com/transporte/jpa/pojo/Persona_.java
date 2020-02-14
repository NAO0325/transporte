package com.transporte.jpa.pojo;

import java.math.BigInteger;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Persona.class)
public abstract class Persona_ {

	public static volatile SingularAttribute<Persona, String> apellidos;
	public static volatile SingularAttribute<Persona, Long> numTelefono;
	public static volatile SingularAttribute<Persona, BigInteger> numdocumento;
	public static volatile SingularAttribute<Persona, Pais> idpais;
	public static volatile SingularAttribute<Persona, Long> idpersona;
	public static volatile CollectionAttribute<Persona, Empresa> empresaCollection;
	public static volatile SingularAttribute<Persona, String> direccion;
	public static volatile SingularAttribute<Persona, Ciudad> idciudad;
	public static volatile SingularAttribute<Persona, String> nombres;
	public static volatile SingularAttribute<Persona, String> tipodocumento;

}

