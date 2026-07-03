package dev.zeekr.invictus_android

abstract class InvictusObject {
    internal abstract val obj: Any

    override fun equals(other: Any?): Boolean {
        return if (other is InvictusObject?) this.obj == other?.obj else false
    }

    override fun hashCode(): Int {
        return this.obj.hashCode()
    }

    override fun toString(): String {
        return this.obj.toString()
    }
}