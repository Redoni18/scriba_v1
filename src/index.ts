import { JobScheduler } from './services/JobScheduler'

console.log('[App] Starting the application...')

const jobScheduler = new JobScheduler()

jobScheduler.start()