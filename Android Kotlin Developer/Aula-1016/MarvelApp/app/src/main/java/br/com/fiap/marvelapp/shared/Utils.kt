package br.com.fiap.marvelapp.shared

import java.math.BigInteger
import java.security.MessageDigest

object Utils {
    //função que faz a criptografia , pois na DependencyFactory, ela precisa ir criptografada
    fun md5(input: String): String {
        val bytes = MessageDigest
            .getInstance("MD5")
        return BigInteger(1, bytes.digest(input.toByteArray())).toString(16)
    }
}