<template>
  <div class="min-h-screen bg-gray-50">
    <div class="max-w-6xl mx-auto p-6">
      <h2 class="text-3xl font-bold text-gray-800 mb-8 text-center">
        Panel de Administración
      </h2>

      <div class="flex justify-center mb-6 border-b border-gray-200 flex-wrap">
        <button v-for="tab in tabs" :key="tab.key" @click="activeTab = tab.key" :class="[
          'px-6 py-2 font-medium transition-all duration-200',
          activeTab === tab.key
            ? tab.activeClass
            : 'text-gray-500 hover:text-gray-700'
        ]">
          {{ tab.label }}
        </button>
      </div>

      <div v-if="activeTab === 'add'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
        <h3 class="text-xl font-semibold text-teal-700 mb-4">Agregar nuevo empleado</h3>
        <form @submit.prevent="agregarEmpleado" class="space-y-4">
          <div>
            <label class="block text-gray-700 font-medium mb-1">Nombre</label>
            <input v-model="nuevoEmpleado.nombre" type="text"
              class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required />
          </div>
          <div>
            <label class="block text-gray-700 font-medium mb-1">Correo</label>
            <input v-model="nuevoEmpleado.email" type="email"
              class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required />
          </div>
          <div>
            <label class="block text-gray-700 font-medium mb-1">Rol</label>
            <select v-model="nuevoEmpleado.role"
              class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required>
              <option value="" disabled>Seleccionar rol...</option>
              <option value="ADMIN">Administrador</option>
              <option value="LOGISTIC">Logística</option>
              <option value="SELLER">Vendedor</option>
            </select>
          </div>
          <button type="submit" class="px-5 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg shadow transition">
            Guardar
          </button>
        </form>
      </div>

      <div v-else-if="activeTab === 'listado'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
        <h3 class="text-xl font-semibold text-cyan-700 mb-4">Listado de empleados</h3>
        <div v-if="loading" class="text-center text-gray-500 py-6">
          <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
        </div>

        <div v-else class="divide-y">
          <div v-for="empleado in empleados" :key="empleado.id" class="py-4">
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
              <div>
                <p class="font-semibold text-gray-800">{{ empleado.firstName }} {{ empleado.lastName }}</p>
                <p class="text-sm text-gray-600">{{ empleado.email }}</p>
              </div>
              <button @click="toggleMenu(empleado.id)"
                class="mt-2 sm:mt-0 px-4 py-1.5 bg-cyan-600 hover:bg-cyan-700 text-white rounded-lg text-sm transition flex items-center">
                Editar
                <i v-if="menuActivo === empleado.id" class="pi pi-chevron-down ml-2"></i>
                <i v-else class="pi pi-chevron-left ml-2"></i>
              </button>
            </div>

            <transition name="fade">
              <div v-if="menuActivo === empleado.id"
                class="mt-4 bg-gray-50 border border-gray-200 rounded-lg p-4 shadow-inner">
                <div v-if="loadingChanges">
                  <i class="pi pi-spin pi-spinner" style="font-size: 2rem;"></i>
                </div>
                <div v-else>
                  <form @submit.prevent="guardarCambios(empleado.id)" class="grid md:grid-cols-2 gap-4">
                    <div>
                      <label class="block text-gray-700 font-medium mb-1">Nombre</label>
                      <input v-model="empleado.firstName" type="text"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-cyan-500 outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-700 font-medium mb-1">Apellido</label>
                      <input v-model="empleado.lastName" type="text"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-cyan-500 outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-700 font-medium mb-1">Correo</label>
                      <input v-model="empleado.email" type="email"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-cyan-500 outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-700 font-medium mb-1">Dirección</label>
                      <input v-model="empleado.address" type="text"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-cyan-500 outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-700 font-medium mb-1">Teléfono</label>
                      <input v-model="empleado.phone" type="text"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-cyan-500 outline-none" />
                    </div>
                  </form>
                  <div class="flex justify-end mt-4 space-x-2">
                    <button @click="guardarCambios(empleado.id)"
                      class="px-4 py-2 bg-pink-600 hover:bg-pink-700 text-white rounded-lg text-sm">
                      Guardar
                    </button>
                    <button @click="menuActivo = null"
                      class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 rounded-lg text-sm">
                      Cancelar
                    </button>
                  </div>
                </div>
              </div>
            </transition>
          </div>
        </div>
      </div>

      <div v-else-if="activeTab === 'history'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
        <h3 class="text-xl font-semibold text-pink-700 mb-4">Historial de empleados</h3>
        <div v-if="loadingHistorial" class="text-center text-gray-500 py-6">
          <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
        </div>
        <div v-else-if="historial.length === 0" class="text-center text-gray-500 py-6">
          No hay registros de historial.
        </div>
        <div v-else class="space-y-3">
          <div v-for="item in historial" :key="item.id"
            class="border border-gray-200 rounded-lg p-4 bg-gray-50 hover:bg-gray-100 transition">
            <p class="text-gray-700"><span class="font-semibold">{{ item.action }}</span> — {{ item.description }}</p>
            <p class="text-sm text-gray-500">Fecha: {{ formatDate(item.created_at) }}</p>
            <p class="text-sm text-gray-500">Usuario: {{ item.user.username }}</p>
          </div>
        </div>
      </div>

      <div v-else-if="activeTab === 'reports'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
        <h3 class="text-xl font-semibold text-amber-700 mb-4">Reportes del sistema</h3>

        <div class="mb-4 flex gap-2">
          <input v-model="filtro.startDate" type="date" class="border p-2 rounded-lg" />
          <input v-model="filtro.endDate" type="date" class="border p-2 rounded-lg" />
          <button @click="fetchReports" class="px-4 py-2 bg-amber-600 hover:bg-amber-700 text-white rounded-lg">
            Consultar
          </button>
        </div>

        <div v-if="loadingReports" class="text-center text-gray-500 py-6">
          <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
        </div>

        <div v-else class="space-y-6">
          <div v-for="(list, key) in reports" :key="key" class="border rounded-lg p-4">
            <h4 class="font-semibold text-lg mb-2 capitalize text-amber-800">
              {{ formatearTitulo(key) }}
            </h4>
            <div v-if="list.length === 0" class="text-gray-500 text-sm">Sin resultados.</div>
            <ul v-else class="space-y-1">
              <li v-for="item in list" :key="item.name" class="flex justify-between text-gray-700">
                <span>{{ item.name }}</span>
                <span class="font-semibold">
                  {{ item.totalSold || item.totalProfit || item.totalOrders || item.totalProducts }}
                </span>
              </li>
            </ul>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const activeTab = ref('add')
const tabs = [
  { key: 'add', label: 'Agregar Empleado', activeClass: 'border-b-4 border-teal-600 text-teal-700' },
  { key: 'listado', label: 'Listado de Empleados', activeClass: 'border-b-4 border-cyan-600 text-cyan-700' },
  { key: 'history', label: 'Historial de Empleados', activeClass: 'border-b-4 border-pink-600 text-pink-700' },
  { key: 'reports', label: 'Reportes', activeClass: 'border-b-4 border-amber-600 text-amber-700' }
]

const nuevoEmpleado = ref({ nombre: '', email: '', role: '' })
const empleados = ref([])
const historial = ref([])
const reports = ref({})
const filtro = ref({ startDate: '', endDate: '' })

const loading = ref(false)
const loadingChanges = ref(false)
const loadingHistorial = ref(false)
const loadingReports = ref(false)
const menuActivo = ref(null)

const agregarEmpleado = async () => {
  try {
    await axios.post('/admin/empleados', nuevoEmpleado.value)
    alert('Empleado agregado correctamente')
    nuevoEmpleado.value = { nombre: '', email: '', role: '' }
    fetchEmpleados()
  } catch (e) {
    console.error('Error al agregar empleado:', e)
  }
}

const fetchEmpleados = async () => {
  loading.value = true
  try {
    const res = await axios.get('/admin/empleados')
    empleados.value = res.data
  } catch (e) {
    console.error('Error al obtener empleados:', e)
  } finally {
    loading.value = false
  }
}

const fetchHistorial = async () => {
  loadingHistorial.value = true
  try {
    const res = await axios.get('/admin/logs')
    historial.value = res.data
    console.log(res.data)
  } catch (e) {
    console.error('Error al obtener historial:', e)
  } finally {
    loadingHistorial.value = false
  }
}

const fetchReports = async () => {
  loadingReports.value = true
  try {
    const { startDate, endDate } = filtro.value
    const start = new Date(startDate).toISOString()
    const end = new Date(endDate).toISOString()
    const res = await axios.get('/admin/reports/top-productos')
    reports.value = res.data
  } catch (e) {
    console.error('Error al obtener reportes:', e)
    alert('No se pudieron cargar los reportes')
  } finally {
    loadingReports.value = false
  }
}

const toggleMenu = (id) => {
  menuActivo.value = menuActivo.value === id ? null : id
}

const guardarCambios = async (id) => {
  const empleado = empleados.value.find(e => e.id === id)
  if (!empleado) return
  try {
    loadingChanges.value = true
    await axios.put(`/admin/empleados/${id}`, empleado)
    alert('Cambios guardados correctamente')
  } catch (e) {
    console.error('Error al guardar cambios:', e)
    alert('Error al guardar los cambios')
  } finally {
    loadingChanges.value = false
  }
}

const formatDate = (dateString) => new Date(dateString).toLocaleString()

const formatearTitulo = (key) => {
  const titulos = {
    topProductos: 'Top 10 Productos más Vendidos',
    topClientesPorGanancia: 'Top 5 Clientes con Más Ganancias',
    topClientesQueMasHanVendido: 'Top 5 Clientes que Más Han Vendido',
    topClientesConMasPedidos: 'Top 10 Clientes con Más Pedidos',
    topClientesConMasProductos: 'Top 10 Clientes con Más Productos Activos'
  }
  return titulos[key] || key
}

onMounted(() => {
  fetchEmpleados()
  fetchHistorial()
})
</script>
