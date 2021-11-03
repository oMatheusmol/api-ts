import moment from "moment";
import ReservaRepository from "./Reservas.repository";
import EmailDataRepository from "../Utils/EmailData.repository";
import EmailService from "../Utils/Email.service";
import IReserva from "../Reservas/Reserva.interface";
import Helpers from "../Utils/Helpers";
import fs from "fs";
import path from "path";
import config from "config";

const emailService = new EmailService();
const EmailData = new EmailDataRepository();

export default class ReservaService extends ReservaRepository {

}
